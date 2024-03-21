package com.example.gobetween;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;


public class ComplaintAdapter extends RecyclerView.Adapter<ComplaintAdapter.MyViewHolder> {

    String type[], content[], reply[],view[];
    Context context;
    OnItemClickListener itemClickListener;
    public ComplaintAdapter(Context ct, String typeData[], String contentData[],String replyData[]) {
        context = ct;
        type = typeData;
        content = contentData;
        reply = replyData;
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
        if (!reply[position].equals("0") && !reply[position].equals("")) {
            holder.replyText.setText(reply[position]);
//            holder.view.setText("Complaint Reply");
        } else {
            holder.replyText.setVisibility(View.GONE);
            holder.viewText.setVisibility(View.GONE);
        }
    }

    @Override
    public int getItemCount() {
        return type.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        TextView typeText,contentText,replyText,viewText;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            typeText = itemView.findViewById(R.id.typeView);
            contentText = itemView.findViewById(R.id.contentView);
            replyText = itemView.findViewById(R.id.ReplyView);
            viewText= itemView.findViewById(R.id.viewText);
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

