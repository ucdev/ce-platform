
IF EXISTS
	(
		SELECT * FROM sys.objects
		WHERE object_id = OBJECT_ID(N'[dbo].[fn_decToBase]')
		AND type in (N'FN', N'IF', N'TF', N'FS', N'FT')
	)
	
	DROP FUNCTION [dbo].[fn_decToBase];
Create function [dbo].[fn_decToBase]
	(
		@val as BigInt,
		@base as int
	)
	returns varchar(63)
	as
	Begin
		If (@val<0) OR (@base < 2) OR (@base> 36) Return Null;
		Declare @answer as varchar(63);
		Declare @alldigits as varchar(36);
		Set @alldigits='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
		Set @answer='';
		While @val>0
		Begin
			Set @answer=Substring(@alldigits,@val % @base + 1,1) + @answer;
			Set @val = @val / @base;
		End
	
		/* Return the final answer */
		return @answer;
	End;
