# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-02 23:22
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0013_auto_20170702_0807'),
    ]

    operations = [
        migrations.AlterField(
            model_name='storyflatpage',
            name='story_date',
            field=models.DateField(default=datetime.datetime(2017, 7, 3, 0, 22, 28, 96978)),
        ),
    ]