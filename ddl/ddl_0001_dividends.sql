CREATE TABLE dividends
(
  SEQ_NUM BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
  STOCK_CODE VARCHAR(6),
  COMPANY VARCHAR(MAX),
  SECTOR VARCHAR(MAX),
  SECOND_SECTOR VARCHAR(MAX),
  STOCK_PRICE DECIMAL(15,4),
  STOCK_TYPE VARCHAR(3),
  VALUATION DECIMAL(15,4),
  STOCK_AVAILABLE_VOLUME INT,
  VOL_NEGOTIATED_LAST_21 DECIMAL(15,4),
  DIVIDEND_LAST_PRICE DECIMAL(15,4),
  COMPANY_NET_PROFIT DECIMAL(15,4),
  DIVIDEND_YIELD DECIMAL(15,4),
  DIVIDEND_AVG_PAYOUT_12_MOS DECIMAL(15,4),
  DIVIDEND_AVG_PAYOUT_5_YRS DECIMAL(15,4),
  MAJOR_SHARE_HOLDER VARCHAR(MAX),
  COMPANY_ROE DECIMAL(15,4),
  COMPANY_ROE_5_YRS DECIMAL(15,4),
  COMP_GROSSDEBT_EBTIDA DECIMAL(15,4),
  DIVIDEND_YIELD_5_YRS DECIMAL(15,4),
  HAS_DIVIDEND_SRD_5_YRS INT,
  HAS_DIVIDEND_GRWTH_5_YRS INT,
  HAS_NET_PROFIT_REG_5_YRS INT,
  DT_LAST_UPDATE DATE
);