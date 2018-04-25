from django import forms
from .models import *


class NewPersonForm(forms.ModelForm):
    class Meta:
        model = Person
        exclude = ['address']


class NewAddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = '__all__'



