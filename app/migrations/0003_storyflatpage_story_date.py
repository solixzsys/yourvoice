# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-06-22 12:44
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_storyflatpage'),
    ]

    operations = [
        migrations.AddField(
            model_name='storyflatpage',
            name='story_date',
            field=models.DateField(default=datetime.datetime(2017, 6, 22, 13, 44, 18, 270131)),
        ),
    ]