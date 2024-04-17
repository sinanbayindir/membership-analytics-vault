if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(df, *args, **kwargs):
    print(df.columns)
    new_column_order = [
        'report_date',
        'user_id',
        'days_active',
        'contract_length',
        'money_spent',
        'occupation',
        'cancelled', 
        'invites_sent',
        'used_coupon_code',
        
        ]

    # reindex ile sütunları yeniden sıralayalım
    df = df.reindex(columns=new_column_order)

    return df


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
