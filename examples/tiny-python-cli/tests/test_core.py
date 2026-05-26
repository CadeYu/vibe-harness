import unittest

from tiny_issues.core import IssueStore


class IssueStoreTest(unittest.TestCase):
    def test_create_project_and_issue_then_close_issue(self) -> None:
        store = IssueStore()

        project = store.create_project("Harness")
        issue = store.create_issue(project.id, "Add audit command")

        self.assertEqual(issue.status, "open")
        self.assertEqual(
            [item.title for item in store.list_issues(project.id)],
            ["Add audit command"],
        )

        closed = store.close_issue(issue.id)

        self.assertEqual(closed.status, "closed")

    def test_closing_missing_issue_fails(self) -> None:
        store = IssueStore()

        with self.assertRaisesRegex(KeyError, "missing issue"):
            store.close_issue("missing")


if __name__ == "__main__":
    unittest.main()

