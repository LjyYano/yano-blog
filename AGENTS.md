# Yano Blog Repository Guidelines

## Project

This repository powers Yano's personal blog at `https://yano.blog`.

- Stack: Jekyll + Markdown + Sass.
- Production branch: `main`.
- Posts live under `_posts/<category>/YYYY-MM-DD-title.md`.
- Current content language is Simplified Chinese.
- Keep the existing visual style unless a task explicitly asks for a redesign.

## Content Rules

- New posts should define or inherit `layout: post`, `title`, `date`, and `categories`.
- Preserve original article meaning and image URLs when migrating historical content.
- Use a space between Chinese and English words where natural, for example `Java 服务端` and `AI Agent`.
- Do not reintroduce Tw93-specific identity, URLs, analytics IDs, project data, comments configuration, or deployment settings.
- Internal links must point to valid pages in this repository; do not invent routes.

## Development

```bash
bundle install
bundle exec jekyll serve
bundle exec jekyll build
```

`npm run dev` and `npm run build` are aliases around the Jekyll commands.

Before merging, at minimum run `bundle exec jekyll build` and fix build errors.

## Structure

- `_config.yml`: site metadata, menu, defaults, plugins.
- `_posts/`: blog content.
- `_layouts/`, `_includes/`: templates.
- `_sass/`, `css/`, `js/`: presentation and behavior.
- `weekly/`: placeholder for the future Weekly section.

Keep changes focused. Content migration, design changes, and infrastructure changes should preferably be separated when practical.
