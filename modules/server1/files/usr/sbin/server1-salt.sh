#!/bin/sh
salt '*' state.show_highstate --yaml
