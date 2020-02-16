ALTER PROCEDURE SP_INSERT_DIVIDEND_ANALYSIS( 
@STOCK_CODE                  VARCHAR (6) 
,@COMPANY                    VARCHAR (MAX) 
,@SECTOR                     VARCHAR (MAX) 
,@SECOND_SECTOR              VARCHAR (MAX) 
,@STOCK_PRICE                DECIMAL (15, 4) 
,@STOCK_TYPE                 VARCHAR (3) 
,@VALUATION                  DECIMAL (15, 4) 
,@STOCK_AVAILABLE_VOLUME     INT 
,@VOL_NEGOTIATED_LAST_21     DECIMAL (15, 4) 
,@DIVIDEND_LAST_PRICE        DECIMAL (15, 4) 
,@COMPANY_NET_PROFIT         INT 
,@DIVIDEND_YELD              DECIMAL (15, 4) 
,@DIVIDEND_AVG_PAYOUT_12_MOS DECIMAL (15, 4) 
,@DIVIDEND_AVG_PAYOUT_5_YRS  DECIMAL (15, 4) 
,@MAJOR_SHARE_HOLDER         VARCHAR (MAX) 
,@COMPANY_ROE                DECIMAL (15, 4) 
,@COMPANY_ROE_5_YRS          DECIMAL (15, 4) 
,@COMP_GROSSDEBT_EBTIDA      DECIMAL (15, 4) 
,@DIVIDEND_YIELD_5_YRS       DECIMAL (15, 4) 
,@HAS_DIVIDEND_SRD_5_YRS     INT 
,@HAS_DIVIDEND_GRWTH_5_YRS   INT 
,@HAS_NET_PROFIT_REG_5_YRS   INT) 
AS 
    IF EXISTS (SELECT STOCK_CODE FROM DIVIDENDS WHERE STOCK_CODE = @STOCK_CODE AND DT_LAST_UPDATE = GETDATE())
      UPDATE DIVIDENDS SET 
          STOCK_CODE = @STOCK_CODE 
          ,COMPANY = @COMPANY 
          ,SECTOR = @SECTOR 
          ,SECOND_SECTOR = @SECOND_SECTOR 
          ,STOCK_PRICE = @STOCK_PRICE 
          ,STOCK_TYPE = @STOCK_TYPE 
          ,VALUATION = @VALUATION 
          ,STOCK_AVAILABLE_VOLUME = @STOCK_AVAILABLE_VOLUME 
          ,VOL_NEGOTIATED_LAST_21 = @VOL_NEGOTIATED_LAST_21 
          ,DIVIDEND_LAST_PRICE = @DIVIDEND_LAST_PRICE 
          ,COMPANY_NET_PROFIT = @COMPANY_NET_PROFIT 
          ,DIVIDEND_YELD = @DIVIDEND_YELD 
          ,DIVIDEND_AVG_PAYOUT_12_MOS = @DIVIDEND_AVG_PAYOUT_12_MOS 
          ,DIVIDEND_AVG_PAYOUT_5_YRS = @DIVIDEND_AVG_PAYOUT_5_YRS 
          ,MAJOR_SHARE_HOLDER = @MAJOR_SHARE_HOLDER 
          ,COMPANY_ROE = @COMPANY_ROE 
          ,COMPANY_ROE_5_YRS = @COMPANY_ROE_5_YRS 
          ,COMP_GROSSDEBT_EBTIDA = @COMP_GROSSDEBT_EBTIDA 
          ,DIVIDEND_YIELD_5_YRS = @DIVIDEND_YIELD_5_YRS 
          ,HAS_DIVIDEND_SRD_5_YRS = @HAS_DIVIDEND_SRD_5_YRS 
          ,HAS_DIVIDEND_GRWTH_5_YRS = @HAS_DIVIDEND_GRWTH_5_YRS 
          ,HAS_NET_PROFIT_REG_5_YRS = @HAS_NET_PROFIT_REG_5_YRS 
          ,DT_LAST_UPDATE = GETDATE()
      WHERE 
          STOCK_CODE = @STOCK_CODE 
          AND DT_LAST_UPDATE = GETDATE()
    ELSE
      INSERT INTO DIVIDENDS 
                  (STOCK_CODE 
                  ,COMPANY 
                  ,SECTOR 
                  ,SECOND_SECTOR 
                  ,STOCK_PRICE 
                  ,STOCK_TYPE 
                  ,VALUATION 
                  ,STOCK_AVAILABLE_VOLUME 
                  ,VOL_NEGOTIATED_LAST_21 
                  ,DIVIDEND_LAST_PRICE 
                  ,COMPANY_NET_PROFIT 
                  ,DIVIDEND_YELD 
                  ,DIVIDEND_AVG_PAYOUT_12_MOS 
                  ,DIVIDEND_AVG_PAYOUT_5_YRS 
                  ,MAJOR_SHARE_HOLDER 
                  ,COMPANY_ROE 
                  ,COMPANY_ROE_5_YRS 
                  ,COMP_GROSSDEBT_EBTIDA 
                  ,DIVIDEND_YIELD_5_YRS 
                  ,HAS_DIVIDEND_SRD_5_YRS 
                  ,HAS_DIVIDEND_GRWTH_5_YRS 
                  ,HAS_NET_PROFIT_REG_5_YRS 
                  ,DT_LAST_UPDATE) 
      VALUES      ( @STOCK_CODE 
                    ,@COMPANY 
                    ,@SECTOR 
                    ,@SECOND_SECTOR 
                    ,@STOCK_PRICE 
                    ,@STOCK_TYPE 
                    ,@VALUATION 
                    ,@STOCK_AVAILABLE_VOLUME 
                    ,@VOL_NEGOTIATED_LAST_21 
                    ,@DIVIDEND_LAST_PRICE 
                    ,@COMPANY_NET_PROFIT 
                    ,@DIVIDEND_YELD 
                    ,@DIVIDEND_AVG_PAYOUT_12_MOS 
                    ,@DIVIDEND_AVG_PAYOUT_5_YRS 
                    ,@MAJOR_SHARE_HOLDER 
                    ,@COMPANY_ROE 
                    ,@COMPANY_ROE_5_YRS 
                    ,@COMP_GROSSDEBT_EBTIDA 
                    ,@DIVIDEND_YIELD_5_YRS 
                    ,@HAS_DIVIDEND_SRD_5_YRS 
                    ,@HAS_DIVIDEND_GRWTH_5_YRS 
                    ,@HAS_NET_PROFIT_REG_5_YRS
                    ,GETDATE()
                  ); 
GO 