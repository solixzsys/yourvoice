# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-06-16 10:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0006_auto_20170616_1127'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='polloption',
            name='polloption_question',
        ),
        migrations.AddField(
            model_name='poll',
            name='poll_options',
            field=models.ManyToManyField(to='app.PollOption'),
        ),
    ]
