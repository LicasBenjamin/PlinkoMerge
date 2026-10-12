# PlinkoMerge

## Current Game ##

PlinkoMerge is a Godot game about choosing coins from an inventory, dropping them through a Plinko board, earning currency, and combining matching coins into higher-value versions.

### What Is Playable Now ##

- **Main menu and save/continue:** Start a new game, save and quit, then continue a saved run.
- **Plinko gameplay:** Select a coin from the inventory and drop it onto the board. Coins land in bronze, silver, or gold award areas that grant currency based on the coin's value.
- **Coin collection and merging:** The game includes coins from 1 through 2048. Drag two matching coins together to merge them into the next value.
- **Inventory:** Coins can be selected for dropping, rearranged with drag and drop, and held in unlockable inventory slots.
- **Rounds and score targets:** Choose from easy, medium, and hard enemy/score targets. Each round has five coin drops; reach the target score to win currency or lose when the drops run out.
- **Basic shop:** A shop screen is available between rounds. Its current three purchase paths are more inventory space, a new 1-point coin when there is room, and a Plinko award-area upgrade; the award-area upgrade path is slated for removal during the shop rework.
- **Upgrade progression:** Shop items can unlock follow-up upgrades and increase in price. The current award-area upgrades change the gameplay board and are slated to be replaced by a separate effect Plinko machine.
- **Sound and interface feedback:** The game includes coin, purchase, and error sounds, along with pause and game-over screens.

## In Progress / Needs Completion ##

These systems already have a starting point in the project but need further work, testing, or polish before they should be considered complete.

- **Shop balancing:**
  - [ ] Remove the current gameplay-board award-area upgrade button, its follow-up upgrade chain, and the related purchase handlers/resources; do not change the main board's scoring awards through the shop.
  - [ ] Keep inventory-slot unlocks and 1-point coin purchases as core shop options. Define their prices, price scaling, unlock limits, and behavior when the inventory is full.
  - [ ] Build a separate effect Plinko machine as the third core shop option. It should accept a selected inventory coin, charge the entry price, and apply the effect of the effect-machine award area where it lands.
  - [ ] Define the effect-machine transaction rules before implementation: when the selected coin is returned, transformed, or consumed; how entry costs scale; and what happens when an effect cannot be applied.
  - [ ] Refactor the shop around reusable, data-driven offers and effects so the UI displays an option and sends a purchase request, while shop logic validates affordability, availability, capacity, and applies the result.
  - [ ] Keep the three core shop paths understandable and reliably available; vary prices, effect-machine modifiers, and any optional offers without randomly removing essential ways to expand or replenish the inventory.
  - [ ] Balance purchase costs against round rewards across early, middle, and later rounds and difficulties. Check that useful purchases remain attainable without making inventory growth or coin buying automatic choices.
  - [ ] Consolidate shop spending, round rewards, and the HUD around the active single currency; remove references to the inactive legacy bronze/silver/gold currency path.
  - [ ] Verify currency, inventory, slot count, upgrades, active effects, and any in-progress shop state behave consistently when saving and continuing a run.
  - [ ] Playtest each purchase path and its failure cases, including insufficient currency, a full inventory, a capped slot upgrade, an invalid/missing selected coin, and an effect with no valid target.
- **Save data:** Expand saves beyond the current run currency, round, and enemy target values to include inventory, purchased upgrades, shop state, and other progression.
- **Round polish:** Improve the win/loss flow, rewards, difficulty scaling, and communication of remaining drops and score targets.
- **Artwork and UI:** Replace or refine placeholder UI elements, Plinko visuals, coin presentation, and shop readability.
- **Audio:** Add and balance additional gameplay sound effects and music.

## Planned: Dynamic Shop and Effect Plinko ##

The shop rework starts with three clear paths: buy inventory space, buy a 1-point coin, or use a separate effect Plinko machine with a selected inventory coin. The machine's award areas grant effects; they do not upgrade the gameplay board's scoring areas. A data-driven shop can later add rotating modifiers and optional offers without hiding the core choices. Dynamic offers, rerolls, and the effect machine are **not yet in the game**.

### Shop Structure To-Do ##

- [ ] Treat an inventory-slot purchase, a 1-point coin purchase, and an effect-machine use as the three core shop paths. Clearly show each path's price, effect, and availability.
- [ ] Define shop offers and effect-machine modifiers as data rather than encoding behavior in button labels or scattered UI handlers. Give each entry a stable ID, description, cost/rules, and effect parameters.
- [ ] Keep shop state and purchase rules in a manager or equivalent gameplay layer; let reusable UI entries display the current data and request an action. Validate and apply purchases centrally so a failed purchase never spends currency or partially applies an effect.
- [ ] Keep the basic slot and coin options available as appropriate, and vary the effect-machine award modifiers and optional offers between visits. Add a small rotating offer pool only after the three core paths work and are balanced.
- [ ] If rerolls are added, charge for them, show the next price, and increase the price for each reroll during that shop visit. Never reroll away access to all practical choices.
- [ ] Set an explicit rule for the selected coin. Recommended default: return it unchanged after a roll unless the displayed effect explicitly transforms or consumes it.
- [ ] Set and communicate the machine entry cost and any price progression. Charge only after confirming the selected coin and effect can be resolved.
- [ ] Give each award area a clear icon, short effect text, and odds/rarity information before the player commits. Keep effects distinct from permanent inventory upgrades and from the main board's currency awards.
- [ ] Handle full inventory, insufficient currency, capped slot upgrades, missing or changed coin selection, duplicate/upgrade effects with no room, and temporary effects at round/run boundaries.
- [ ] Save the inventory and purchased progression, plus any active run effects and shop state needed to resume without rerolling or charging the player unexpectedly.

### Effect-Machine Modifier Ideas ##

- Duplicate the selected coin, if there is room in the inventory.
- Upgrade the selected coin by one level.
- Grant a bonus 1-point coin or a random low-level coin.
- Apply a temporary score multiplier to a clearly specified number of future drops.
- Give the selected coin a round-limited drop benefit, such as auto-drop or a shorter cooldown.
- Protect the selected coin from being consumed by its next merge.
- Transform the selected coin into a random coin one or two levels higher, with a clearly communicated rare jackpot chance.

### Design Suggestions ##

- Clearly distinguish permanent/run progression, inventory purchases, and temporary effects so players can understand what lasts and what is spent.
- Introduce rarity and stronger modifiers gradually; keep the effect outcomes and probabilities legible and avoid making early shops depend on rare results.
- Always display the active currency balance, open inventory slots, slot limit, selected coin, and effect-machine entry cost.
- Treat discounts, free machine uses, and limited-use coupons as later optional offers, not requirements for the core shop to function.
- Ensure each visit has a useful choice and that no purchase can silently fail after currency has been deducted.

## Future Ideas ##

- Additional coin types, Plinko board layouts, and award-area effects.
- More enemies, difficulty modifiers, and round objectives.
- Expanded visual themes, music, and sound effects.
