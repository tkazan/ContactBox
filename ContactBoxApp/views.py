from django.http import HttpResponse
from django.shortcuts import render
from django.views import View
from .models import *

# Create your views here.


def home(request):
    persons = Person.objects.all().order_by('surname')
    ctx = {
        "persons": persons,
    }
    return render(request, 'ContactBox/home.html', ctx)


class NewPersonView(View):
    def get(self, request):
        pass

    def post(self, request):
        pass


class ShowPersonView(View):
    def get(self, request):
        pass

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
