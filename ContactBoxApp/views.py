from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.views import View
from django.urls import reverse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.forms import formset_factory, inlineformset_factory

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


def show_person(request, id):
    person = get_object_or_404(Person, pk=id)
    try:
        next_person = Person.objects.filter(pk__gt=id).order_by('id')[0].id
    except:
        next_person = None
    try:
        p = Person.objects.filter(id__lt=id).order_by('id')
        prev = p[len(p)-1].id
    except:
        prev = None
    ctx = {
        'person': person,
        'next': next_person,
        'prev': prev,
    }
    return render(request, 'ContactBox/show.html', ctx)


class SearchPersonView(View):

    def get(self, request):
        return HttpResponse('Tutaj bedzie wyszukiwarka')

    def post(self, request):
        pass


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

            if f.address is None:
                f.address = f2
            f.save()
            f3 = form3.save(commit=False)
            f3.person = f
            f3.save()
            f4 = form4.save(commit=False)
            f4.person = f
            f4.save()
            f5 = form5.save(commit=False)
            try:
                f5.person = f
                f5.save()
            except:
                pass

            return redirect(reverse('contactbox:home'))

        return redirect(reverse('contactbox:new'))


class ModifyPersonView(View):

    def get(self, request, id):
        person = get_object_or_404(Person, pk=id)

        form = NewPersonForm(instance=person)
        form2 = NewAddressForm(instance=person.address)

        PhoneFormSet = inlineformset_factory(Person, Phone, fields='__all__',
                                             extra=1, can_delete=False)
        form3 = PhoneFormSet(instance=person)

        EmailFormSet = inlineformset_factory(Person, Email, fields='__all__',
                                             extra=1, can_delete=False)
        form4 = EmailFormSet(instance=person)

        PersonGroupsFormSet = formset_factory(NewPersonGroupsForm)
        form5 = PersonGroupsFormSet(initial=[
            {'groups': element.groups} for element in
            PersonGroups.objects.filter(person=person)
        ])

        ctx = {
            "person": person,
            'form': form,
            'form2': form2,
            'form3': form3,
            'form4': form4,
            'form5': form5,
        }
        return render(request, "ContactBox/modify.html", ctx)

    def post(self, request, id):
        person = get_object_or_404(Person, pk=id)

        form = NewPersonForm(request.POST, instance=person)
        form2 = NewAddressForm(request.POST)

        PhoneFormSet = inlineformset_factory(Person, Phone, fields='__all__')
        form3 = PhoneFormSet(request.POST, instance=person)

        EmailFormSet = inlineformset_factory(Person, Email, fields='__all__')
        form4 = EmailFormSet(request.POST, instance=person)

        PersonGroupsFormSet = formset_factory(NewPersonGroupsForm)
        form5 = PersonGroupsFormSet(request.POST)

        if (form.is_valid() and form2.is_valid() and form3.is_valid()
           and form4.is_valid() and form5.is_valid()):
            f = form.save(commit=False)
            if f.address is None:
                f2 = form2.save()
                f.address = f2
            f.save()

            for form in form3:
                if form.is_valid():
                    f3 = form.save(commit=False)
                    if f3.number is not None:
                        form.save()
                    if f3.id is not None and f3.number is None:
                        f3.delete()

            for form in form4:
                if form.is_valid():
                    f4 = form.save(commit=False)
                    if f4.email != "":
                        form.save()
                    if f4.id is not None and f4.email == "":
                        f4.delete()

            for form in form5:
                if form.is_valid():
                    f5 = form.save(commit=False)
                    try:
                        f5.person = person
                        groups_list = [element.groups for element in PersonGroups.objects.filter(person=person)]
                        if f5.groups not in groups_list:
                            f5.save()
                    except:
                        pass

            return redirect(reverse('contactbox:person', args=(id,)))

        return redirect(reverse('contactbox:modify', args=(id,)))


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

