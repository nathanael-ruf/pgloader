# PGLoader - Azure SQL Server Fix

This PGLoader repo is specifically catered for Azure SQL Server to PostgreSQL migration which applies the fix for [ Not able to connect to Azure SQL #1324 ](https://github.com/dimitri/pgloader/issues/1324)

### Usage

Docker image available on DockerHub.

```bash
docker run --rm -it jahan9/pgloader:latest pgloader --version

pgloader version "3.6.9"
compiled with SBCL 2.2.9.debian
```

For detailed usage refer to original [pgloader](https://github.com/dimitri/pgloader) project.
