Feed cache (Redis):

1. Лента по пользователю:

   Key: feeds:by_user:{user_id}

2. Лента по подпискам:

   Key: feeds:by_subscription:{subscriber_id}

3. Лента по локациям:

   Key: feeds:by_location:{geo_tag}

Feed:
- application/json

```json
{
    "pagination": {
        "next_page_token": "..."
    },
    "data": [
        {
            "post_id": "...",
            "author": {
                "author_id": "...",
                "username": "..."
            },
            "title": "...",
            "content": "...",
            "geo_tags": ["...", "..."],
            "image_urls": ["...", "..."],
            "is_edited:": false,
            "created_at": "..."
        }
    ]
}
```