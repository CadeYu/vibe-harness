from __future__ import annotations

from tiny_issues.core import IssueStore


def main() -> None:
    store = IssueStore()
    project = store.create_project("Harness")
    issue = store.create_issue(project.id, "Show the harness loop")
    closed = store.close_issue(issue.id)

    print(f"{project.name}: {closed.title} [{closed.status}]")


if __name__ == "__main__":
    main()

