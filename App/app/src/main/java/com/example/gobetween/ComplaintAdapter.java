package com.example.gobetween;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;


public class ComplaintAdapter extends RecyclerView.Adapter<ComplaintAdapter.MyViewHolder> {

    String type[], content[];
    Context context;
    OnItemClickListener itemClickListener;
    TextView reply;
    public ComplaintAdapter(Context ct, String typeData[], String contentData[]) {
        context = ct;
        type = typeData;
        content = contentData;
    }

    // Setter method for click listener
    public void setOnItemClickListener(OnItemClickListener listener) {
        itemClickListener = listener;

    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.complaint_design, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
//        Picasso.get().load(pic[position]).into(holder.propic);
        holder.typeText.setText(type[position]);
        holder.contentText.setText(content[position]);
    }

    @Override
    public int getItemCount() {
        return type.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        //        ImageView propic;
        TextView typeText,contentText;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            typeText = itemView.findViewById(R.id.typeView);
            contentText = itemView.findViewById(R.id.contentView);
            reply = itemView.findViewById(R.id.reply);

            // Set click listener for itemView
            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View v) {
            if (itemClickListener != null) {
                int position = getAdapterPosition();
                if (position != RecyclerView.NO_POSITION) {
                    itemClickListener.onItemClick(position);
                }
            }
        }

    }

    // Interface for item click events
    public interface OnItemClickListener {
        void onItemClick(int position);
    }
}

