# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-08 12:51
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0018_auto_20170708_0924'),
    ]

    operations = [
        migrations.AddField(
            model_name='surveytag',
            name='survey_image',
            field=models.FileField(blank=True, upload_to='passport/%Y/%m/%d'),
        ),
        migrations.AlterField(
            model_name='storyflatpage',
            name='story_date',
            field=models.DateField(default=datetime.datetime(2017, 7, 8, 13, 51, 6, 722458)),
        ),
    ]
