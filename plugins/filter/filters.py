from collections.abc import Iterable


class FilterModule(object):
    """my format filters."""

    def with_format(self, item, string):
        """Format `string` using `item`."""
        match item:
            case dict():
                return string.format(**item)
            case Iterable() if not isinstance(item, str):
                return string.format(*item)
            case _:
                return string.format(item)

    def filters(self):
        """Return the filter list."""
        return {"with_format": self.with_format}
