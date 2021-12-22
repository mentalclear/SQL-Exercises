
-- This implies that Apache Drill is used, I don't have it.
SELECT file_name, is_directory, is_file, permission
FROM information_schema.`files`
WHERE schema_name = 'dfs.data';