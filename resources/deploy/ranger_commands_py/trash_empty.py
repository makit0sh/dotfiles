class empty(Command):
    """:empty

    Empties the gio trash
    """

    def execute(self):
        self.fm.run("gio trash --empty")

class trash(Command):
    """:trash

    Show the gio trash
    """

    def execute(self):
        self.fm.cd("~/.local/share/Trash/files")

