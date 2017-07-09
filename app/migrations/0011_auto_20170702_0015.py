# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-01 23:15
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0010_auto_20170701_2110'),
    ]

    operations = [
        migrations.CreateModel(
            name='Quotes',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quote', models.TextField()),
                ('author', models.CharField(max_length=20)),
                ('domain', models.CharField(max_length=20)),
            ],
        ),
        migrations.AlterField(
            model_name='storyflatpage',
            name='story_date',
            field=models.DateField(default=datetime.datetime(2017, 7, 2, 0, 15, 18, 567731)),
        ),
    ]