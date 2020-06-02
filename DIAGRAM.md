# Objects & Messages Diagram

Interaction diagram that shows how Objects use Messages to communicate with one another.
```
CLASS           <--          METHOD          --> OUTPUT

Takeaway        <--        show_menu         --> string
Takeaway        <-- take_order({ dish, int}) --> hash
Takeaway        <--       confirm_order      --> float

Menu            <--          dishes          --> hash
Menu            <--           list           --> string
Menu            <--       has_dish?(dish)    --> boolean
Menu            <--         price(dish)      --> float

Order           <--          dishes          --> hash
Order           <--      add(dish, int)      --> hash
Order           <--           total          --> float
```
Back to [readme](README.md).
