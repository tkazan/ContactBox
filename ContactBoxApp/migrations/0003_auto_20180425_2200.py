# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-04-25 22:00
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ContactBoxApp', '0002_auto_20180425_1112'),
    ]

    operations = [
        migrations.AlterField(
            model_name='email',
            name='type',
            field=models.IntegerField(choices=[(1, 'private'), (2, 'business')], default=1),
        ),
        migrations.AlterField(
            model_name='phone',
            name='number',
            field=models.CharField(max_length=64),
        ),
        migrations.AlterField(
            model_name='phone',
            name='type',
            field=models.IntegerField(choices=[(1, 'home'), (2, 'mobile'), (3, 'business')], default=1),
        ),
    ]
