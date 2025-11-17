# Security Policy

## Cloudflare R2 Setup & Access Control

This project uses Cloudflare R2 (S3-compatible object storage) to host NHANES datasets publicly. The security model follows industry best practices for open data distribution.

### Access Model

#### Public Read Access (Users)
- **Who:** Anyone on the internet
- **Access:** HTTPS GET requests to `https://nhanes.kylegrealis.com/`
- **Authentication:** None required
- **Purpose:** Allow researchers to freely download NHANES datasets
- **Operations:** Read-only (download `.parquet` files)

#### Private Write Access (Maintainers)
- **Who:** Package maintainer + GitHub Actions workflow
- **Access:** S3-compatible API with scoped credentials
- **Authentication:** R2 API token (stored in GitHub Secrets)
- **Purpose:** Upload updated datasets from CDC servers
- **Operations:** Write, update, delete (limited to `nhanes-data` bucket)

### Setting Up R2 Credentials

#### Step 1: Create Scoped R2 API Token

1. Log in to your [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Navigate to **R2** → **Overview**
3. Click **Manage R2 API Tokens**
4. Click **Create API Token**
5. Configure the token:
   - **Token name:** `nhanes-data-workflow`
   - **Permissions:** Object Read & Write
   - **TTL:** 1 year (set calendar reminder to rotate)
   - **Bucket scope:** `nhanes-data` (specific bucket only)
   - **IP restrictions:** Optional (GitHub Actions IPs change, generally leave empty)

6. Click **Create API Token**
7. **CRITICAL:** Copy the following values immediately (they won't be shown again):
   - Access Key ID
   - Secret Access Key
   - Account ID (also visible in R2 dashboard URL)

#### Step 2: Add Credentials to GitHub Secrets

1. Go to your GitHub repository
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret** and add each of the following:

| Secret Name | Value | Notes |
|------------|-------|-------|
| `R2_ACCOUNT_ID` | Your Cloudflare Account ID | Visible in dashboard URL |
| `R2_ACCESS_KEY_ID` | Access Key ID from Step 1 | Starts with long alphanumeric string |
| `R2_SECRET_ACCESS_KEY` | Secret Access Key from Step 1 | Long random string - NEVER commit to git |

4. Verify all three secrets are listed in the repository secrets page

#### Step 3: Test Locally (Optional)

To test R2 upload locally before pushing to GitHub:

```r
# Set environment variables (DO NOT commit these!)
Sys.setenv(R2_ACCOUNT_ID = "your_account_id")
Sys.setenv(R2_ACCESS_KEY_ID = "your_access_key_id")
Sys.setenv(R2_SECRET_ACCESS_KEY = "your_secret_access_key")

# Test upload
library(nhanesdata)
demo <- pull_nhanes('demo')
nhanes_pin_write(demo, 'demo', 'nhanes-data')
```

**Important:** Never commit `.Renviron` or `.env` files containing these credentials to git!

### Security Best Practices

#### Token Management
- ✅ **DO:** Use scoped tokens limited to specific buckets
- ✅ **DO:** Rotate tokens at least annually
- ✅ **DO:** Set calendar reminders for token expiration
- ✅ **DO:** Revoke tokens immediately if compromised
- ❌ **DON'T:** Use account-level admin tokens
- ❌ **DON'T:** Share tokens across multiple projects
- ❌ **DON'T:** Commit tokens to git (add to `.gitignore`)

#### GitHub Actions Security
- ✅ **DO:** Pin action versions (e.g., `actions/checkout@v4`)
- ✅ **DO:** Use minimal permissions in workflow `permissions:` block
- ✅ **DO:** Enable branch protection on `main` branch
- ✅ **DO:** Require PR reviews before merging
- ❌ **DON'T:** Use `permissions: write-all`
- ❌ **DON'T:** Disable required status checks

#### R2 Bucket Configuration
- ✅ **DO:** Enable public read access via custom domain
- ✅ **DO:** Review bucket access logs periodically
- ✅ **DO:** Enable versioning (pins handles this automatically)
- ✅ **DO:** Set lifecycle policies if storage costs become a concern
- ❌ **DON'T:** Grant public write access
- ❌ **DON'T:** Disable access logging

### What If Credentials Are Compromised?

If you suspect R2 credentials have been exposed:

1. **Immediately revoke the token** in Cloudflare dashboard
   - R2 → Manage R2 API Tokens → Find token → Delete

2. **Create a new scoped token** (follow Step 1 above)

3. **Update GitHub Secrets** with new credentials

4. **Review R2 bucket access logs**
   - Check for unauthorized uploads/deletions
   - Cloudflare dashboard → R2 → Analytics

5. **Verify data integrity**
   - Run workflow manually to re-upload all datasets
   - Check checksums in `.checksums.json`

6. **Consider additional measures:**
   - Enable Cloudflare Access policies
   - Add IP restrictions to new token (if feasible)
   - Investigate how credentials were exposed

### Security Model Justification

This project uses **public read / private write** because:

1. **Data is inherently public** - NHANES data is publicly available from CDC
2. **Open science** - Facilitates reproducible research
3. **Industry standard** - Same model as CRAN, Bioconductor, AWS Open Data
4. **Limited risk** - R2 token has no billing/account management permissions
5. **Auditable** - All access logged by Cloudflare
6. **Cost-effective** - No need for authentication infrastructure

### Reporting Security Issues

If you discover a security vulnerability in this project:

1. **DO NOT** open a public GitHub issue
2. Email the maintainer directly (see `DESCRIPTION` file for contact)
3. Include:
   - Description of vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if known)

I will respond within 48 hours and work with you to resolve the issue before public disclosure.

### Compliance & Privacy

- **HIPAA:** NHANES data is de-identified and publicly released by CDC. No PHI is stored in this project.
- **GDPR:** No personal data collected or stored by this infrastructure.
- **Data Ownership:** All data sourced from CDC public repositories under their usage terms.

### Questions?

For questions about security configuration, open a GitHub Discussion or contact the maintainer.

---

**Last Updated:** 2025-01-16
**Next Review:** 2026-01-16
