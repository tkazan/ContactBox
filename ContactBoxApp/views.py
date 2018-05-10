from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.views import View
from django.urls import reverse

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
        form3 = NewPhoneForm()
        form4 = NewEmailForm()
        form5 = NewGroupsForm()
        ctx = {
            'form': form,
            'form2': form2,
            'form3': form3,
            'form4': form4,
            'form5': form5,
        }
        return render(request, 'ContactBox/new.html', ctx)

    def post(self, request):
        form = NewPersonForm(request.POST)
        form2 = NewAddressForm(request.POST)
        form3 = NewPhoneForm(request.POST)
        form4 = NewEmailForm(request.POST)
        form5 = NewGroupsForm(request.POST)

        if form.is_valid():
            f = form.save()
            return redirect(reverse('contactbox:home'))


    # form = NewPostForm(request.POST)
    # description = request.POST.get('description')
    # if form.is_valid():
    #     f = form.save(commit=False)
    #     f.description = description
    #     f.save()
    #     return redirect(reverse("home"))


class ShowPersonView(View):
    def get(self, request, id):
        person = get_object_or_404(Person, pk=id)
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
    def get(self, request, id):
        person = get_object_or_404(Person, pk=id)
        ctx = {
            "person": person,
        }
        return render(request, "ContactBox/delete.html", ctx)

    def post(self, request, id):
        action = request.POST.get("submit")

        if action == "YES":
            person = Person.objects.get(pk=id)
            person.delete()
        return redirect(reverse("contactbox:home"))
