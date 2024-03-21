package com.example.gobetween;
import static com.example.gobetween.WebServiceCaller.ip;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.squareup.picasso.Picasso;




public class SearchAdapter extends RecyclerView.Adapter<SearchAdapter.MyViewHolder> {

    String company[],Logo[],Logourl[];
    String url= "http://"+ip;

    Context context;
    static OnItemClickListener itemClickListener;
    public SearchAdapter(Context ct, String[] companyData,String[] logo,String[] logourl) {
        context = ct;
        company = companyData;
        Logo = logo;
        Logourl= logourl;


    }

    // Setter method for click listener
    public static void setOnItemClickListener(OnItemClickListener listener) {
        itemClickListener = listener;

    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.company_list_design, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {

        Picasso.get().load(url+Logourl[position]+Logo[position]).into(holder.logo);
        holder.companyText.setText(company[position]);

    }


    public int getItemCount() {
        return company.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        //        ImageView propic;
        TextView companyText;
        ImageView logo;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            companyText = itemView.findViewById(R.id.companyname);
            logo = itemView.findViewById(R.id.logo);

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

