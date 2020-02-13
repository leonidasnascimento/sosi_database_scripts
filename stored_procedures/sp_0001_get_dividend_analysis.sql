SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_get_dividend_analysis](@stock_code varchar(6)) 
AS 
  SELECT TOP 1 
           stock_code, 
           company, 
           sector, 
           second_sector, 
           stock_price, 
           stock_type, 
           valuation, 
           stock_available_volume, 
           vol_negotiated_last_21, 
           dividend_last_price, 
           company_net_profit, 
           dividend_yeld, 
           dividend_avg_payout_12_mos, 
           dividend_avg_payout_5_yrs, 
           major_share_holder, 
           company_roe, 
           company_roe_5_yrs, 
           comp_grossdebt_ebtida, 
           dividend_yield_5_yrs, 
           has_dividend_srd_5_yrs, 
           has_dividend_grwth_5_yrs, 
           has_net_profit_reg_5_yrs, 
           dt_last_update 
  FROM     dbo.dividends 
  WHERE    stock_code = 
           CASE @stock_code 
                    WHEN NULL THEN stock_code 
                    WHEN '' THEN stock_code 
                    ELSE @stock_code 
           END 
  ORDER BY dt_last_update DESC;
GO
