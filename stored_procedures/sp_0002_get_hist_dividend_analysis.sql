SET ansi_nulls ON 
GO

SET quoted_identifier ON 
GO 

ALTER PROCEDURE [dbo].[Sp_get_hist_dividend_analysis](@stock_code VARCHAR(6)) 
AS 
    SELECT stock_code, 
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
           dividend_yield, 
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
    FROM   dbo.dividends 
    WHERE  stock_code = @stock_code
    ORDER BY dt_last_update DESC;
GO