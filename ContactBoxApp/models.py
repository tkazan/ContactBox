from django.db import models


# Create your models here.


class Person(models.Model):
    name = models.CharField(max_length=64)
    surname = models.CharField(max_length=128)
    description = models.TextField(default="")
    address = models.ForeignKey("Address")

    def __str__(self):
        return "{} {}".format(self.name, self.surname)


class Address(models.Model):
    city = models.CharField(max_length=64)
    street = models.CharField(max_length=128)
    house_nr = models.IntegerField()
    flat_nr = models.IntegerField(null=True, blank=True)

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
    number = models.CharField(max_length=64)
    type = models.IntegerField(choices=phone_types)

    def __str__(self):
        return "{} {} {} - {}".format(self.person.name, self.person.surname,
                                    self.number, self.get_type_display())


email_types = (
    (1, 'private'),
    (2, 'business'),
)


class Email(models.Model):
    person = models.ForeignKey("Person")
    email = models.EmailField()
    type = models.IntegerField(choices=email_types)

    def __str__(self):
        return "{} {} - {} - {}".format(self.person.name, self.person.surname,
                                    self.email, self.get_type_display())


class Groups(models.Model):
    person = models.ManyToManyField("Person")
    name = models.CharField(max_length=128)

    def __str__(self):
        return self.name
