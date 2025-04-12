from django.contrib import admin
from django.utils.html import format_html
from .models import BlogPost

class BlogPostAdmin(admin.ModelAdmin):
    # This defines the columns to be displayed in the list view
    list_display = ('title', 'date_posted', 'image_preview')  # We add the image_preview method here

    # This method generates the thumbnail HTML for the image field
    def image_preview(self, obj):
        if obj.image:
            return format_html('<img src="{}" width="100" />', obj.image.url)  # Render image safely
        return "-"  # If no image, show a dash

    # Optionally, this is for customizing the column name that shows in the admin panel
    image_preview.short_description = 'Thumbnail'  # This sets the column title for the image preview

# Register the BlogPost model with the custom admin
admin.site.register(BlogPost, BlogPostAdmin)
