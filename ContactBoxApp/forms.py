from django import forms
from .models import *


class NewPersonForm(forms.ModelForm):
    class Meta:
        model = Person
        fields = '__all__'


class NewAddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = '__all__'


class NewPhoneForm(forms.ModelForm):
    class Meta:
        model = Phone
        exclude = ('person',)


class NewEmailForm(forms.ModelForm):
    class Meta:
        model = Email
        exclude = ('person',)


class NewGroupsForm(forms.ModelForm):
    class Meta:
        model = Groups
        exclude = ('person',)


