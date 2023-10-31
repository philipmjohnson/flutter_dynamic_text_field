# flutter_dynamic_text_field

This sample app illustrates two Flutter form concepts:

1. How to create a dynamic (expandable and contractable) set of text fields within a form.
2. How to create a custom form field in [Flutter Form Builder](https://pub.dev/packages/flutter_form_builder).

This example includes a validator to check that all fields have values upon pressing the submit button.

Here's an example screenshot showing the display after three items have been entered.

<img width="300px" src="README.png">

### Creating a dynamic set of text fields

This is accomplished via the Stateful widget called DynamicTextField.  It maintains a state variable called fieldValuesList, which is a list of strings. Each time a character is entered into a field, or the button is pressed to add or subtract a text field, this state variable is updated.

This means that the fieldValuesList has a continuously up-to-date representation of the values entered into the set of text fields, as well as the number of text fields displayed in the form. 

### Creating a custom Form Builder field

A helpful overview of this process is available in [Building a custom field with FormBuilder Flutter package](https://medium.com/@danvickmiller/building-a-custom-flutter-form-builder-field-c67e2b2a27f4).

In the case of this sample app, it involved having the DynamicTextField widget return a FormBuilderField. 

Then, whenever the state of fieldValuesList was changed, the widget invoked field.didChange() with the fieldValuesList. This communicated to the FormBuilder the up-to-date state of the form field.

Finally, when the submit button is pressed, the form is validated.  The sample system attaches a validator to each text field to ensure that no fields are empty. If all the fields are non-empty, then the list of string values are printed. Otherwise, the form will indicate an error under the offending text field.
