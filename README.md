# flutter_dynamic_text_field

This sample app illustrates two useful Flutter form concepts:

1. How to create a dynamic (expandable and contractable) set of text fields within a form.
2. How to provide this dynamic set of text fields as a single, reusable custom form field in [Flutter Form Builder](https://pub.dev/packages/flutter_form_builder).

This example includes a validator to check that all fields have values upon pressing the submit button.

Here's an example screenshot showing the display after two items have been entered, a third field has been added but left empty, and the submit button has been pushed (triggering a validation error).

<img width="300px" src="README.png">

If that field were to be made valid (by, say, typing "2 eggs"), then upon submission the following will be printed to the console:

```
flutter: on Submit: [1 cup flour, 4 tbs salt, 2 eggs]
```

## How to create a dynamic set of text fields

This is accomplished via the Stateful widget called DynamicTextField.  It maintains a state variable called fieldValuesList, which is a list of strings. Each time a character is entered into a field, or the button is pressed to add or subtract a text field, this state variable is updated.

This means that the fieldValuesList has a continuously up-to-date representation of the values entered into the set of text fields, as well as the number of text fields displayed in the form. 

## How to create a custom Form Builder field

A helpful overview of this process is available in [Building a custom field with FormBuilder Flutter package](https://medium.com/@danvickmiller/building-a-custom-flutter-form-builder-field-c67e2b2a27f4).

In the case of this sample app, it involves having the DynamicTextField widget return a FormBuilderField. 

Then, whenever the state of fieldValuesList changes, the widget invokes `field.didChange(fieldValuesList)`. This communicates the latest state to the FormBuilder.

Finally, when the submit button is pressed, the form is validated.  The sample system attaches a validator to each text field to ensure that no fields are empty. If all the fields are non-empty, then the list of string values are printed. Otherwise, the form will indicate an error under the offending text field.

## Miscellaneous implementation issues

I encountered a few implementation gotchas while developing this example code. Here is a brief summary.

### 1. Using keyOffset to control text field rebuilding

The implementation process required solving a couple of problems in the DynamicTextField widget.

1. If a new key is provided each time the text fields are re-rendered, then the text field loses focus.  This is irritating since the text fields are re-rendered every time a character is typed into them. The recommended way to solve this problem is to avoid generating a new key each time the form is rendered, as discussed in this [StackOverflow Question: TextFormField is losing focus - flutter](https://stackoverflow.com/questions/48845568/textformfield-is-losing-focus-flutter).

2. If you follow the above advice, and provide a "constant" key to prevent a new one from being generated (for example `GlobalObjectKey(index)`), then you encounter a new problem: when you hit the "delete" button, the UI will act as if the last field was deleted, regardless of which delete button you pushed. 

The solution used in this widget is to provide a key based on the current timestamp (called keyOffset) and the index of the text field in the list.  keyOffset is changed only when a field is deleted. This results in the text field keys remaining constant while you type into them (or when you add a new field to the bottom), while new key values are generated when the list decreases (which results in the correct entry being deleted) from the reduced list of values.

### 2. Using scroll physics to enable correct scrolling with nested ListViews

This example is constructed with two ListViews. The first ListView wraps the elements of the entire form. This is so that the *form* can have more fields than will fit on the screen at one time, and if that happens, the user can scroll to see all of the elements. 

The second ListView is part of the implementation of the Dynamic Form Field. This is so that the *field* can have more text field elements than will fit on the screen at one time, and if that happens, the user can scroll to see all of them. 

This creates a kind of conflict of interest: when the user attempts to scroll, which widget (the field or the form?) has control at what point in time? To get the appropriate behavior, this sample system provides the parameter `physics: const AlwaysScrollableScrollPhysics(),` to the ListView associated with the form, and the parameter `physics: const ClampingScrollPhysics()` to the ListView associated with the field. This results in the desired behavior: once you've scrolled to the end of the field, you can continue to scroll to the end of the form. 

### 3. Set the focus when a new text field is created

When the user types the "+" button to create a new text field, it is useful for the focus to shift automatically to the newly created text field so that the user can immediately start typing into the new field. An approach to this behavior is documented in [Changing focus from one text field to the next in Flutter](https://stackoverflow.com/questions/49410975/changing-focus-from-one-text-field-to-the-next-in-flutter), which almost works: the focus is changed, but the field does not accept typed characters immediately. I applied [this workaround](https://github.com/flutter/flutter/issues/95553#issuecomment-1120141268) to get the desired behavior. 

Note that it would be nice to have the tab and shift-tab key presses shift the focus backward and forward, but that is not currently implemented.
