<?php 
// 前端传入路由
    $menu = [
            [
            "path" => "/home",
            "name"  => "home",
            "label" => "首页",
            "icon" => "s-home",
            "url" => "home/Home"
            ],
            [
            "path"=> "/user",
            "name"=> "user",
            "label"=> "用户管理",
            "icon"=> "user-solid",
            "url"=> "user/User" 
            ],
            [
            "path"=> "/sellTickets",
            "name"=> "sellTickets",
            "label"=> "售票管理",
            "icon"=> "s-order",
            "url"=> "ticket/SellTickets"
            ],
            [
            "path"=> "/ticketClass",
            "name"=> "ticketClass",
            "label"=> "票务管理",
            "icon"=> "s-ticket",
            "url"=> "ticketClass/TicketClass"   
            ],
            [
            "path"=> "/search",
            "name"=> "search",
            "label"=> "管理员审核",
            "icon"=> "s-promotion",
            "url"=> "search/Search"
            ],
            [
            "path"=> "/stats",
            "name"=> "stats",
            "label"=> "统计",
            "icon"=> "s-data",
            "url"=> "stats/Stats"
            ],
            [
            "label"=> "更多",
            "icon"=> "s-operation",
            "children" => [
                [
                    "path"=> "/setting",
                    "name"=> "setting",
                    "label"=> "留言板",
                    "icon"=> "setting",
                    "url"=> "set/Setting"
                ],
                [
                    "path"=> "/userSet",
                    "name"=> "userSet",
                    "label"=> "用户设置",
                    "icon"=> "setting",
                    "url"=> "set/UserSet"
                ],
            ]
            ],
    ];

    $menus = [
        [
        "path" => "/home",
        "name"  => "home",
        "label" => "首页",
        "icon" => "s-home",
        "url" => "home/Home"
        ],
        [
        "path"=> "/user",
        "name"=> "user",
        "label"=> "用户管理",
        "icon"=> "user-solid",
        "url"=> "user/User" 
        ],
        [
        "path"=> "/sellTickets",
        "name"=> "sellTickets",
        "label"=> "售票管理",
        "icon"=> "s-order",
        "url"=> "ticket/SellTickets"
        ],
        [
            "path"=> "/ticketClass",
            "name"=> "ticketClass",
            "label"=> "票务管理",
            "icon"=> "s-ticket",
            "url"=> "ticketClass/TicketClass"   
        ],
        [
        "path"=> "/stats",
        "name"=> "stats",
        "label"=> "统计",
        "icon"=> "s-data",
        "url"=> "stats/Stats"
        ],
        [
        "label"=> "更多",
        "icon"=> "s-operation",
        "children" => [
            [
                "path"=> "/setting",
                "name"=> "setting",
                "label"=> "留言板",
                "icon"=> "setting",
                "url"=> "set/Setting"
            ],
        ]
        ],
];



?>