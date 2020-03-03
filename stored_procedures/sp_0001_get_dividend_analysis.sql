SET ansi_nulls ON 
GO

SET quoted_identifier ON 
GO 

ALTER PROCEDURE [dbo].[Sp_get_dividend_analysis](@stock_code VARCHAR(6)) 
AS
       DROP TABLE IF EXISTS #UPDT_ITEMS 
       DROP TABLE IF EXISTS #NOT_UPDT_ITEMS 

       SELECT * 
       INTO   #UPDT_ITEMS 
       FROM   ( 
                     SELECT STOCK_CODE, 
                            COMPANY, 
                            SECTOR, 
                            SECOND_SECTOR, 
                            STOCK_PRICE, 
                            STOCK_TYPE, 
                            VALUATION, 
                            STOCK_AVAILABLE_VOLUME, 
                            VOL_NEGOTIATED_LAST_21, 
                            DIVIDEND_LAST_PRICE, 
                            COMPANY_NET_PROFIT, 
                            DIVIDEND_YIELD, 
                            DIVIDEND_AVG_PAYOUT_12_MOS, 
                            DIVIDEND_AVG_PAYOUT_5_YRS, 
                            MAJOR_SHARE_HOLDER, 
                            COMPANY_ROE, 
                            COMPANY_ROE_5_YRS, 
                            COMP_GROSSDEBT_EBTIDA, 
                            DIVIDEND_YIELD_5_YRS, 
                            HAS_DIVIDEND_SRD_5_YRS, 
                            HAS_DIVIDEND_GRWTH_5_YRS, 
                            HAS_NET_PROFIT_REG_5_YRS, 
                            DT_LAST_UPDATE 
                     FROM   DIVIDENDS 
                     WHERE  DT_LAST_UPDATE = 
                            ( 
                                   SELECT TOP 1 
                                          DT_LAST_UPDATE 
                                   FROM     DIVIDENDS 
                                   ORDER BY DT_LAST_UPDATE DESC) 
                            AND stock_code = IIF(@stock_code = '', stock_code, ISNULL(@stock_code, stock_code)) 
              ) AS UPDATED_ITEMS

       SELECT * 
       INTO   #NOT_UPDT_ITEMS 
       FROM   ( 
                     SELECT   STOCK_CODE, 
                            COMPANY, 
                            SECTOR, 
                            SECOND_SECTOR, 
                            STOCK_PRICE, 
                            STOCK_TYPE, 
                            VALUATION, 
                            STOCK_AVAILABLE_VOLUME, 
                            VOL_NEGOTIATED_LAST_21, 
                            DIVIDEND_LAST_PRICE, 
                            COMPANY_NET_PROFIT, 
                            DIVIDEND_YIELD, 
                            DIVIDEND_AVG_PAYOUT_12_MOS, 
                            DIVIDEND_AVG_PAYOUT_5_YRS, 
                            MAJOR_SHARE_HOLDER, 
                            COMPANY_ROE, 
                            COMPANY_ROE_5_YRS, 
                            COMP_GROSSDEBT_EBTIDA, 
                            DIVIDEND_YIELD_5_YRS, 
                            HAS_DIVIDEND_SRD_5_YRS, 
                            HAS_DIVIDEND_GRWTH_5_YRS, 
                            HAS_NET_PROFIT_REG_5_YRS, 
                            Max(DT_LAST_UPDATE) AS dt_last_update 
                     FROM     DIVIDENDS D 
                     WHERE    D.STOCK_CODE NOT IN (SELECT STOCK_CODE FROM   #UPDT_ITEMS) 
                              AND D.STOCK_CODE = IIF(@stock_code = '', stock_code, ISNULL(@stock_code, stock_code))     
                     GROUP BY STOCK_CODE, 
                            COMPANY, 
                            SECTOR, 
                            SECOND_SECTOR, 
                            STOCK_PRICE, 
                            STOCK_TYPE, 
                            VALUATION, 
                            STOCK_AVAILABLE_VOLUME, 
                            VOL_NEGOTIATED_LAST_21, 
                            DIVIDEND_LAST_PRICE, 
                            COMPANY_NET_PROFIT, 
                            DIVIDEND_YIELD, 
                            DIVIDEND_AVG_PAYOUT_12_MOS, 
                            DIVIDEND_AVG_PAYOUT_5_YRS, 
                            MAJOR_SHARE_HOLDER, 
                            COMPANY_ROE, 
                            COMPANY_ROE_5_YRS, 
                            COMP_GROSSDEBT_EBTIDA, 
                            DIVIDEND_YIELD_5_YRS, 
                            HAS_DIVIDEND_SRD_5_YRS, 
                            HAS_DIVIDEND_GRWTH_5_YRS, 
                            HAS_NET_PROFIT_REG_5_YRS ) AS NOT_UPDATED_ITEMS
       SELECT STOCK_CODE, 
              COMPANY, 
              SECTOR, 
              SECOND_SECTOR, 
              STOCK_PRICE, 
              STOCK_TYPE, 
              VALUATION, 
              STOCK_AVAILABLE_VOLUME, 
              VOL_NEGOTIATED_LAST_21, 
              DIVIDEND_LAST_PRICE, 
              COMPANY_NET_PROFIT, 
              DIVIDEND_YIELD, 
              DIVIDEND_AVG_PAYOUT_12_MOS, 
              DIVIDEND_AVG_PAYOUT_5_YRS, 
              MAJOR_SHARE_HOLDER, 
              COMPANY_ROE, 
              COMPANY_ROE_5_YRS, 
              COMP_GROSSDEBT_EBTIDA, 
              DIVIDEND_YIELD_5_YRS, 
              HAS_DIVIDEND_SRD_5_YRS, 
              HAS_DIVIDEND_GRWTH_5_YRS, 
              HAS_NET_PROFIT_REG_5_YRS, 
              DT_LAST_UPDATE 
       FROM   #UPDT_ITEMS 
       UNION ALL 
       SELECT STOCK_CODE, 
              COMPANY, 
              SECTOR, 
              SECOND_SECTOR, 
              STOCK_PRICE, 
              STOCK_TYPE, 
              VALUATION, 
              STOCK_AVAILABLE_VOLUME, 
              VOL_NEGOTIATED_LAST_21, 
              DIVIDEND_LAST_PRICE, 
              COMPANY_NET_PROFIT, 
              DIVIDEND_YIELD, 
              DIVIDEND_AVG_PAYOUT_12_MOS, 
              DIVIDEND_AVG_PAYOUT_5_YRS, 
              MAJOR_SHARE_HOLDER, 
              COMPANY_ROE, 
              COMPANY_ROE_5_YRS, 
              COMP_GROSSDEBT_EBTIDA, 
              DIVIDEND_YIELD_5_YRS, 
              HAS_DIVIDEND_SRD_5_YRS, 
              HAS_DIVIDEND_GRWTH_5_YRS, 
              HAS_NET_PROFIT_REG_5_YRS, 
              DT_LAST_UPDATE 
       FROM   #NOT_UPDT_ITEMS