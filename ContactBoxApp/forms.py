from django import forms
from .models import *


class NewPersonForm(forms.ModelForm):
    class Meta:
        model = Person
        exclude = ('groups',)


class NewAddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = '__all__'


class NewPhoneForm(forms.ModelForm):
    class Meta:
        model = Phone
        exclude = ('person',)
        widgets = {
            'number': forms.TextInput(attrs={'placeholder': 'tylko cyfry np. 888888888'})
        }


class NewEmailForm(forms.ModelForm):
    class Meta:
        model = Email
        exclude = ('person',)


class NewGroupsForm(forms.ModelForm):
    class Meta:
        model = Groups
        fields = '__all__'


class NewPersonGroupsForm(forms.ModelForm):
    class Meta:
        model = PersonGroups
        exclude = ('person',)
