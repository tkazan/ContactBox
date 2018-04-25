from django.http import HttpResponse
from django.shortcuts import render
from django.views import View
from .models import *
from .forms import *

# Create your views here.


def home(request):
    persons = Person.objects.all().order_by('surname')
    ctx = {
        "persons": persons,
    }
    return render(request, 'ContactBox/home.html', ctx)


class NewPersonView(View):
    def get(self, request):
        form = NewPersonForm()
        form2 = NewAddressForm()
        ctx = {
            'form': form,
            'form2': form2,
        }
        return render(request, 'ContactBox/new.html', ctx)

    def post(self, request):
        pass


class ShowPersonView(View):
    def get(self, request, id):
        person = Person.objects.get(id=id)
        ctx = {
            'person': person,
        }
        return render(request, 'ContactBox/show.html', ctx)

    def post(self, request):
        pass


class ModifyPersonView(View):
    def get(self, request):
        pass

    def post(self, request):
        pass


class DeletePersonView(View):
    def get(self, request):
        pass

    def post(self, request):
        pass
