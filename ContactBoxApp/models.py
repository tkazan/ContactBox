from django.db import models


# Create your models here.


class Person(models.Model):
    name = models.CharField(max_length=64, verbose_name='Imię', blank=True)
    surname = models.CharField(max_length=128, verbose_name='Nazwisko', blank=True)
    description = models.TextField(default="", verbose_name='Opis', blank=True)
    address = models.ForeignKey("Address", blank=True, null=True)
    groups = models.ManyToManyField("Groups", blank=True)

    def __str__(self):
        return "{} {}".format(self.name, self.surname)


class Address(models.Model):
    city = models.CharField(max_length=64, verbose_name='Miasto', blank=True)
    street = models.CharField(max_length=128, verbose_name='Ulica', blank=True)
    house_nr = models.IntegerField(verbose_name='Nr domu', blank=True, null=True)
    flat_nr = models.IntegerField(verbose_name='Nr mieszkania', blank=True, null=True)

    def __str__(self):
        if self.flat_nr:
            return "{}, {} {}/{}".format(self.city, self.street,
                                        self.house_nr, self.flat_nr)
        else:
            return "{}, {} {}".format(self.city, self.street, self.house_nr)


phone_types = (
    (1, "home"),
    (2, "mobile"),
    (3, "business"),
)


class Phone(models.Model):
    person = models.ForeignKey("Person")
    number = models.CharField(max_length=64, verbose_name='Numer', blank=True, null=True)
    type = models.IntegerField(choices=phone_types, verbose_name='Typ',
                               blank=True, null=True)

    def __str__(self):
        return "{} {} {} - {}".format(self.person.name, self.person.surname,
                                    self.number, self.get_type_display())


email_types = (
    (1, 'private'),
    (2, 'business'),
)


class Email(models.Model):
    person = models.ForeignKey("Person")
    email = models.EmailField(blank=True)
    type = models.IntegerField(choices=email_types, verbose_name='Typ',
                               blank=True, null=True)

    def __str__(self):
        return "{} {} - {} - {}".format(self.person.name, self.person.surname,
                                    self.email, self.get_type_display())


class Groups(models.Model):
    name = models.CharField(max_length=128, verbose_name='Nazwa', blank=True)

    def __str__(self):
        return self.name
