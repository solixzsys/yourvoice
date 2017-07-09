# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-08 07:59
from __future__ import unicode_literals

import ckeditor_uploader.fields
import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0016_auto_20170708_0837'),
    ]

    operations = [
        migrations.AddField(
            model_name='storyflatpage',
            name='story_feature_image',
            field=ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True, verbose_name='feature image'),
        ),
        migrations.AlterField(
            model_name='storyflatpage',
            name='story_date',
            field=models.DateField(default=datetime.datetime(2017, 7, 8, 8, 59, 21, 167138)),
        ),
    ]