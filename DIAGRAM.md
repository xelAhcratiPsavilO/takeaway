# Objects & Messages Diagram

Interaction diagram that shows how Objects use Messages to communicate with one another.
```
CLASS           <--          METHOD          --> OUTPUT

Takeaway        <--        show_menu         --> string
Takeaway        <-- take_order({ dish, int}) --> hash

Menu            <--          dishes          --> hash
Menu            <--           list           --> string
Menu            <--       has_dish?(dish)    --> boolean

Order           <--          dishes          --> hash
Order           <--      add(dish, int)      --> hash
```
Back to [readme](README.md).
