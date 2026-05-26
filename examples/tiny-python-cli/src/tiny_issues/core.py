from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class Project:
    id: str
    name: str


@dataclass(frozen=True)
class Issue:
    id: str
    project_id: str
    title: str
    status: str


class IssueStore:
    def __init__(self) -> None:
        self._projects: dict[str, Project] = {}
        self._issues: dict[str, Issue] = {}
        self._next_project_id = 1
        self._next_issue_id = 1

    def create_project(self, name: str) -> Project:
        project = Project(id=f"project-{self._next_project_id}", name=name)
        self._next_project_id += 1
        self._projects[project.id] = project
        return project

    def create_issue(self, project_id: str, title: str) -> Issue:
        if project_id not in self._projects:
            raise KeyError(f"missing project: {project_id}")

        issue = Issue(
            id=f"issue-{self._next_issue_id}",
            project_id=project_id,
            title=title,
            status="open",
        )
        self._next_issue_id += 1
        self._issues[issue.id] = issue
        return issue

    def list_issues(self, project_id: str) -> list[Issue]:
        return [issue for issue in self._issues.values() if issue.project_id == project_id]

    def close_issue(self, issue_id: str) -> Issue:
        if issue_id not in self._issues:
            raise KeyError(f"missing issue: {issue_id}")

        issue = self._issues[issue_id]
        closed = Issue(
            id=issue.id,
            project_id=issue.project_id,
            title=issue.title,
            status="closed",
        )
        self._issues[closed.id] = closed
        return closed

