from django.http import HttpResponse
from django.shortcuts import render
from django.views import View
# Create your views here.


def home(request):
    return render(request, 'ContactBox/home.html')


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
