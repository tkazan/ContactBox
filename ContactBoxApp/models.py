from django.db import models


# Create your models here.


class Person(models.Model):
    name = models.CharField(max_length=64)
    surname = models.CharField(max_length=128)
    description = models.TextField(default="")
    address = models.ForeignKey("Address")

    def __str__(self):
        return self.name, self.surname


class Address(models.Model):
    city = models.CharField(max_length=64)
    street = models.CharField(max_length=128)
    house_nr = models.IntegerField()
    flat_nr = models.IntegerField(null=True)

    def __str__(self):
        return self.city, self.street, self.house_nr, self.flat_nr


phone_types = (
    (1, 'home'),
    (2, 'mobile'),
    (3, 'business'),
)


class Phone(models.Model):
    person = models.ForeignKey("Person")
    number = models.IntegerField()
    type = models.CharField(max_length=1, choices=phone_types, default=1)

    def __str__(self):
        self.person.name, self.person.surname, self.number, self.type


email_types = (
    (1, 'private'),
    (2, 'business'),
)


class Email(models.Model):
    person = models.ForeignKey("Person")
    email = models.EmailField()
    type = models.CharField(max_length=1, choices=email_types, default=1)

    def __str__(self):
        self.person.name, self.person.surname, self.email, self.type


class Groups(models.Model):
    person = models.ManyToManyField("Person")
    name = models.CharField(max_length=128)
