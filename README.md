# PlinkoMerge

## Current Game ##

PlinkoMerge is a Godot game about choosing coins from an inventory, dropping them through a Plinko board, earning currency, and combining matching coins into higher-value versions.

### What Is Playable Now ##

- **Main menu and save/continue:** Start a new game, save and quit, then continue a saved run.
- **Plinko gameplay:** Select a coin from the inventory and drop it onto the board. Coins land in bronze, silver, or gold award areas that grant currency based on the coin's value.
- **Coin collection and merging:** The game includes coins from 1 through 2048. Drag two matching coins together to merge them into the next value.
- **Inventory:** Coins can be selected for dropping, rearranged with drag and drop, and held in unlockable inventory slots.
- **Rounds and score targets:** Choose from easy, medium, and hard enemy/score targets. Each round has five coin drops; reach the target score to win currency or lose when the drops run out.
- **Basic shop:** A shop screen is available between rounds. Current purchasable upgrades include more inventory space, a new 1-point coin when there is room, and a Plinko award-area upgrade.
- **Upgrade progression:** Shop items can unlock follow-up upgrades, increase in price, and improve selected award areas to produce silver or gold currency.
- **Sound and interface feedback:** The game includes coin, purchase, and error sounds, along with pause and game-over screens.

## In Progress / Needs Completion ##

These systems already have a starting point in the project but need further work, testing, or polish before they should be considered complete.

- **Shop balancing:** Review prices, upgrade effects, unlock order, and scaling so purchases feel worthwhile throughout a run.
- **Currency progression:** Finish and verify bronze, silver, and gold unlock progression and present it clearly in the shop and HUD.
- **Save data:** Expand saves beyond the current run currency, round, and enemy target values to include inventory, purchased upgrades, shop state, and other progression.
- **Round polish:** Improve the win/loss flow, rewards, difficulty scaling, and communication of remaining drops and score targets.
- **Artwork and UI:** Replace or refine placeholder UI elements, Plinko visuals, coin presentation, and shop readability.
- **Audio:** Add and balance additional gameplay sound effects and music.

## Planned: Balatro-Inspired Shop Expansion ##

The existing static shop will be expanded into a choice-driven shop with varied offers between rounds. This is a planned feature; the randomized offers, rerolls, and effect machine are **not yet in the game**.

### Core To-Do ##

- [ ] Show three to five randomized shop offers per visit, with a dependable mix of core upgrades and more unusual options.
- [ ] Add a paid reroll button; make rerolls progressively more expensive during a shop visit.
- [ ] Keep **inventory slot upgrades** as a recurring shop option, with clear maximum-slot information and balanced price progression.
- [ ] Keep **1-point coin purchases** as a recurring shop option so players can rebuild merges or gain another drop option when their inventory has space.
- [ ] Build a **separate effect Plinko machine**. Players spend coins to send one selected inventory coin through this machine and receive the effect of the award area where it lands.
- [ ] Decide and communicate the effect-machine rules: entry price, price scaling, and whether the selected coin is consumed, transformed, or returned after the roll.
- [ ] Give every effect award area an icon, short description, and clear preview before the player commits.
- [ ] Handle edge cases: full inventory, insufficient currency, unavailable selected coin, and effects that create or upgrade coins.
- [ ] Save and restore expanded shop state and any run-only effects.

### Effect-Machine Award Ideas ##

- Duplicate the rolled coin.
- Upgrade the rolled coin by one level.
- Grant a bonus 1-point coin or a random low-level coin.
- Apply a temporary score multiplier to the next few drops.
- Make the selected coin auto-drop or reduce its drop cooldown for the current round.
- Protect the selected coin from being consumed by its next merge or a failed effect.
- Transform the selected coin into a random coin one or two levels higher, with a rare jackpot result.

### Design Suggestions ##

- Clearly style **permanent upgrades** differently from **run-only effects** so choices are easy to understand at a glance.
- Introduce rarity tiers gradually, keeping advanced or high-risk effects out of the earliest shops.
- Always display current spendable coins, open inventory slots, and the effect-machine entry cost in the shop.
- Include occasional special offers such as discounts, free effect-machine uses, or limited-use coupons to give individual runs more personality.
- Ensure at least one practical offer is available in every shop, while reserving a smaller portion of slots for risky or experimental choices.

## Future Ideas ##

- Additional coin types, Plinko board layouts, and award-area effects.
- More enemies, difficulty modifiers, and round objectives.
- Expanded visual themes, music, and sound effects.
