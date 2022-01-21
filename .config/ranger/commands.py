from __future__ import (absolute_import, division, print_function)

from subprocess import check_output
import os

from ranger.api.commands import Command

class mkcd(Command):
    """
    :mkcd <dirname>

    Creates a directory with the name <dirname> and enters it.
    """

    def execute(self):
        from os.path import join, expanduser, lexists
        from os import makedirs
        import re

        dirname = join(self.fm.thisdir.path, expanduser(self.rest(1)))
        if not lexists(dirname):
            makedirs(dirname)

            match = re.search('^/|^~[^/]*/', dirname)
            if match:
                self.fm.cd(match.group(0))
                dirname = dirname[match.end(0):]

            for m in re.finditer('[^/]+', dirname):
                s = m.group(0)
                if s == '..' or (s.startswith('.') and not self.fm.settings['show_hidden']):
                    self.fm.cd(s)
                else:
                    ## We force ranger to load content before calling `scout`.
                    self.fm.thisdir.load_content(schedule=False)
                    self.fm.execute_console('scout -ae ^{}$'.format(s))
        else:
            self.fm.notify("file/directory exists!", bad=True)


# class z(Command):
#     """:z
#     Uses .z file to set the current directory.
#     """
# 
#     def execute(self):
#         # location of rupa z source file
#         z_loc = "$HOME/.oh-my-zsh/plugins/z/z.sh" # getenv("_Z_SRC")
#         try:
#             arguments = 'source {} && _z -e {}'.format(
#                 z_loc, " ".join(self.args[1:]))
#             cmd = ['zsh', '-c', arguments]
#             directory = check_output(cmd).decode("utf-8").rstrip("\n")
#             self.fm.execute_console("cd " + directory)
#         except Exception as e:
#             raise Exception("Directory not found")
