## [1.0.0] - 2026-02-17

### Breaking Changes

- **Auth**: Switched from header-based auth (ApiKey/APIUser) to token-based auth (api_key + username + password)
- **Client**: New constructor — use `Ncba::Client.new` with configuration DSL or keyword args
- **Endpoints**: Removed all old endpoints (AccountOpening, CreditDetails, CreditTransfer, MpesaPhoneNumberValidation, TransactionQuery)

### Added

- Configuration DSL via `Ncba.configure { |c| ... }`
- Sandbox and production environment support
- Token-based authentication via `client.authenticate`
- `ensure_authenticated!` guard on all endpoint methods
- Typed error classes: `AuthenticationError`, `BadRequestError`, `ForbiddenError`, `NotFoundError`, `ServerError`
- New endpoints: `account_details`, `mini_statement`, `account_statement`, `check_transaction_status`, `ift`, `eft`, `rtgs`, `pesalink`, `kplc_postpaid_validation`, `kplc_postpaid`

### Changed

- Upgraded to Faraday ~> 2.0 (dropped faraday_middleware)
- Replaced OpenStruct with hash-based object wrapper
- Fixed `Intance` class name typo to `Instance`
- Requires Ruby >= 3.1.0

### Removed

- `faraday_middleware` dependency
- `dotenv-rails` dependency
- Old resource files and endpoints

## [0.0.5] - 2022-01-01

- Maintenance release

## [0.0.0] - 2021-10-28

- Initial release
