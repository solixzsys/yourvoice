# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-12 08:33
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0020_auto_20170711_0657'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='location',
            field=models.CharField(blank=True, max_length=30),
        ),
        migrations.AlterField(
            model_name='storyflatpage',
            name='story_date',
            field=models.DateField(default=datetime.datetime(2017, 7, 12, 9, 33, 1, 95804)),
        ),
    ]
