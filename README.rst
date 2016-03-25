docker_deepimage
================

Quick and dirty Docker_ image to generate deepstyle_ images.

Usage
-----

``./docker_deepstyle.sh <style_image> <content_image>`` will generate the images and copy them to the current working directory as ``<style>_<content>_<launch_pid>.tgz``.

Uses CPU (rather than GPU) so takes ages and eats memory :)

License
-------

Copyright (c) 2016 Warren Moore

This software may be redistributed under the terms of the MIT License.
See the file LICENSE for details.

Contact
-------

::

          @wamonite     - twitter
           \_______.com - web
    warren____________/ - email

.. _Docker: https://www.docker.com/
.. _deepstyle: https://github.com/jcjohnson/neural-style