docker_deepstyle
================

Quick and dirty Docker_ image to generate neural-art_ style images.

Uses CPU so takes ages and eats memory :)

Usage
-----

Run ``./docker_deepstyle.sh <style_image> <content_image>`` to generate images.

The script will connect to the local/remote Docker daemon and create a container using the deepstyle_ image.

The container is named in the format ``<style_image>_<content_image>_<launch_pid>`` and multiple containers can be run
in parallel.

The images are copied into the container for processing and the generated images are archived and copied to the
local working directory as ``<container_name>.tgz``.

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
.. _neural-art: https://github.com/jcjohnson/neural-style
.. _deepstyle: https://hub.docker.com/r/wamonite/deepstyle/
