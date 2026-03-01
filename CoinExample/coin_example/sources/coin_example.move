module coin_example::coin_example;

use sui::coin_registry;

public struct COIN_EXAMPLE has drop {}

fun init(witness: COIN_EXAMPLE, ctx: &mut TxContext) {
    let (builder, treasury_cap) = coin_registry::new_currency_with_otw(
        witness,
        6,
        b"EXAMPLE_COIN".to_string(),
        b"EXAMPLE_COIN".to_string(),
        b"fake example coin for workshop".to_string(),
        b"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4Z08R7UZYtg_nHiw2CqXdN6v6ngkOGZbLuA&s".to_string(),
        ctx
    );

    let metadata_cap = builder.finalize(ctx);
    transfer::public_transfer(metadata_cap, ctx.sender());
    transfer::public_transfer(treasury_cap, ctx.sender());
}