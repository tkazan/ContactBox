# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-05-10 18:07
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ContactBoxApp', '0003_auto_20180425_2200'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='groups',
            name='person',
        ),
        migrations.AddField(
            model_name='person',
            name='groups',
            field=models.ManyToManyField(to='ContactBoxApp.Groups'),
        ),
        migrations.AlterField(
            model_name='address',
            name='city',
            field=models.CharField(max_length=64, verbose_name='Miasto'),
        ),
        migrations.AlterField(
            model_name='address',
            name='flat_nr',
            field=models.IntegerField(blank=True, null=True, verbose_name='Nr mieszkania'),
        ),
        migrations.AlterField(
            model_name='address',
            name='house_nr',
            field=models.IntegerField(verbose_name='Nr domu'),
        ),
        migrations.AlterField(
            model_name='address',
            name='street',
            field=models.CharField(max_length=128, verbose_name='Ulica'),
        ),
        migrations.AlterField(
            model_name='email',
            name='type',
            field=models.IntegerField(choices=[(1, 'private'), (2, 'business')], verbose_name='Typ'),
        ),
        migrations.AlterField(
            model_name='groups',
            name='name',
            field=models.CharField(max_length=128, verbose_name='Nazwa'),
        ),
        migrations.AlterField(
            model_name='person',
            name='description',
            field=models.TextField(default='', verbose_name='Opis'),
        ),
        migrations.AlterField(
            model_name='person',
            name='name',
            field=models.CharField(max_length=64, verbose_name='Imię'),
        ),
        migrations.AlterField(
            model_name='person',
            name='surname',
            field=models.CharField(max_length=128, verbose_name='Nazwisko'),
        ),
        migrations.AlterField(
            model_name='phone',
            name='number',
            field=models.CharField(max_length=64, verbose_name='Numer'),
        ),
        migrations.AlterField(
            model_name='phone',
            name='type',
            field=models.IntegerField(choices=[(1, 'home'), (2, 'mobile'), (3, 'business')], verbose_name='Typ'),
        ),
    ]
