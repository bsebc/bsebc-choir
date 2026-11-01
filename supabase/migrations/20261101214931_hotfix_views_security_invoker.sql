-- 2026-11-01 hotfix (senior choir only; already applied to the live project).
-- These three old views ran with the owner's rights, and singer_attendance
-- (auto-updatable) accepted inserts, updates and deletes from the public key,
-- bypassing row-level security. Deleting a singer through it also deleted their
-- attendance. The app does not use these views. The youth project's views
-- already had security_invoker on.
alter view public.singer_attendance set (security_invoker = on);
alter view public.song_stats set (security_invoker = on);
alter view public.attendance_marks set (security_invoker = on);
revoke insert, update, delete, truncate, references, trigger
  on public.singer_attendance, public.song_stats, public.attendance_marks
  from anon, authenticated;
