from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.views import View
from django.urls import reverse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from .models import *
from .forms import *

# Create your views here.


def home(request):
    person_list = Person.objects.all().order_by('last')
    page = request.GET.get('page', 1)
    paginator = Paginator(person_list, 5)
    try:
        persons = paginator.page(page)
    except PageNotAnInteger:
        persons = paginator.page(1)
    except EmptyPage:
        persons = paginator.page(paginator.num_pages)

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
        form5 = NewPersonGroupsForm()
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
        form5 = NewPersonGroupsForm(request.POST)

        if (form.is_valid() and form2.is_valid() and form3.is_valid()
            and form4.is_valid() and form5.is_valid()):

            f = form.save(commit=False)
            f2 = form2.save()

            if f.address == None:
                f.address = f2
            f.save()
            f3 = form3.save(commit=False)
            f3.person = f
            f3.save()
            f4 = form4.save(commit=False)
            f4.person = f
            f4.save()
            f5 = form5.save(commit=False)
            f5.person = f
            f5.save()

            return redirect(reverse('contactbox:home'))

        return redirect(reverse('contactbox:new'))


def show_person(request, id):
    person = get_object_or_404(Person, pk=id)
    try:
        next = Person.objects.filter(pk__gt=id)[0].id
    except:
        next = None
    try:
        p = Person.objects.filter(id__lt=id, )
        prev = p[len(p)-1].id
    except:
        prev = None
    ctx = {
        'person': person,
        'next': next,
        'prev': prev,
    }
    return render(request, 'ContactBox/show.html', ctx)


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

        if action == "TAK":
            person = Person.objects.get(pk=id)
            person.delete()
        return redirect(reverse("contactbox:home"))


class GroupsView(View):

    def get(self, request):
        form = NewGroupsForm()
        groups = Groups.objects.all().order_by('groupname')
        ctx = {
            'form': form,
            'groups': groups,
        }
        return render(request, 'ContactBox/groups.html', ctx)

    def post(self, request):
        form = NewGroupsForm(request.POST)

        if form.is_valid():
            form.save()

        return redirect(reverse('contactbox:groups'))


class ModifyGroupView(View):

    def get(self, request, id):
        group = get_object_or_404(Groups, pk=id)
        ctx = {
            "group": group,
        }
        return render(request, "ContactBox/modify-group.html", ctx)

    def post(self, request, id):
        groupname = request.POST.get("groupname")
        group = Groups.objects.get(pk=id)
        try:
            group.groupname = groupname
            group.save()
            return redirect(reverse("contactbox:groups"))
        except Exception as e:
            message = "Something went wrong: {}".format(e)
            ctx = {
                "message": message,
                "group": group,
            }
            return render(request, 'ContactBox/modify-group.html', ctx)


class DeleteGroupView(View):
    def get(self, request, id):
        group = get_object_or_404(Groups, pk=id)
        ctx = {
            "group": group,
        }
        return render(request, "ContactBox/delete-group.html", ctx)

    def post(self, request, id):
        action = request.POST.get("submit")

        if action == "TAK":
            group = Groups.objects.get(pk=id)
            group.delete()
        return redirect(reverse("contactbox:groups"))

